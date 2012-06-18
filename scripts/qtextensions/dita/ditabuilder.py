from os import path
import codecs

from docutils.io import DocTreeInput, StringOutput
from docutils.utils import new_document
from docutils.core import Publisher
from docutils.readers.doctree import Reader as DoctreeReader

from sphinx.builders import Builder
from sphinx.util.osutil import ensuredir, os_path, copyfile
from sphinx.util.pycompat import b
from sphinx.util.console import bold, darkgreen, brown

from ditawriter import DitaWriter
from ditamapwriter import render_map



class DitaBuilder(Builder):
    name = "dita"
    format = 'dita'
    out_suffix = '.dita'
    _publisher = None
    supported_image_types = ['image/png', 'image/jpeg']



    def init(self):
        print('DitaBuilder.init()')

    def get_outdated_docs(self):
        for docname in self.env.found_docs:
            if docname not in self.env.all_docs:
                yield docname
                continue
            targetname = self.env.doc2path(docname, self.outdir,
                                           self.out_suffix)
            try:
                targetmtime = path.getmtime(targetname)
            except Exception:
                targetmtime = 0
            try:
                srcmtime = path.getmtime(self.env.doc2path(docname))
                if srcmtime > targetmtime:
                    yield docname
            except EnvironmentError:
                # source doesn't exist anymore
                pass


    def prepare_writing(self, docnames):
        self.writer = DitaWriter(self)

    def get_target_uri(self, docname, typ=None):
        return docname + self.out_suffix

    def write_doc(self, docname, doctree):
        self.docname = docname
        destination = StringOutput(encoding='utf-8')
        self.writer.write(doctree, destination)
        outfilename = path.join(self.outdir, os_path(docname) + self.out_suffix)
        ensuredir(path.dirname(outfilename))
        try:
            f = codecs.open(outfilename, 'w', 'utf-8')
            try:
                f.write(self.writer.output)
            finally:
                f.close()
        except (IOError, OSError), err:
            self.warn("error writing file %s: %s" % (outfilename, err))
        self.post_process_images(doctree)

    def copy_image_files(self):
        # copy image files
        if self.images:
            for src in self.status_iterator(self.images, 'copying images... ',
                                            brown, len(self.images)):
                dest = path.join(self.outdir, src)
                ensuredir(path.dirname(dest))
                try:
                    copyfile(path.join(self.srcdir, src), dest)
                except Exception, err:
                    self.warn('cannot copy image file %r: %s' %
                              (path.join(self.srcdir, src), err))




    def finish(self):
        node = self.env.get_toctree_for(self.config.master_doc, self, False)
        output = render_map(self, node)
        outfilename = path.join(self.outdir, 'index.ditamap')
        ensuredir(path.dirname(outfilename))
        try:
            f = codecs.open(outfilename, 'w', 'utf-8', 'xmlcharrefreplace')
            try:
                f.write(output)
            finally:
                f.close()
        except (IOError, OSError), err:
            self.warn("error writing file %s: %s" % (outfilename, err))
        self.copy_image_files()

