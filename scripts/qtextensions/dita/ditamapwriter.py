from lxml import etree

from docutils.io import DocTreeInput, StringOutput
from docutils.utils import new_document
from docutils.core import Publisher
from docutils.readers.doctree import Reader as DoctreeReader
from docutils import nodes, writers

from sphinx.util.pycompat import b

XML_HEAD = u"""<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE map PUBLIC "-//OASIS//DTD DITA Map//EN" "../dtd/map.dtd">
"""

def render_map(builder, node):
    if node:
        doc = new_document(b('<partial node>'))
        doc.append(node)

        publisher = Publisher( source_class = DocTreeInput, destination_class=StringOutput)
        publisher.set_components('standalone', 'restructuredtext', 'pseudoxml')
        publisher.reader = DoctreeReader()
        publisher.writer = DitaMapWriter(builder)
        publisher.process_programmatic_settings(None, {'output_encoding': 'utf-8'}, None)
        publisher.set_source(doc, None)
        publisher.set_destination(None, None)
        publisher.publish()
        return publisher.writer.output
    output = XML_HEAD
    output += u"<map></map>"
    return output

class DitaMapWriter(writers.Writer):
    def __init__(self, builder):
        writers.Writer.__init__(self)
        self.builder = builder

    def translate(self):
        visitor = DitaMapTranslator(self.document, self.builder)
        self.document.walkabout(visitor)
        self.output = XML_HEAD
        self.output += visitor.body

class DitaMapTranslator(nodes.NodeVisitor):
    def __init__(self, document, builder):
        nodes.NodeVisitor.__init__(self, document)
        self.builder = builder
        self.root = None
        self.node = None
        self.parent = None

    def visit_document(self, node):
        self.root = self.node = self.parent = etree.Element('map')

    def depart_document(self, node):
        self.body = etree.tostring(self.root, pretty_print=True)

    def visit_Text(self, node):
        pass

    def depart_Text(self, node):
        pass

    def visit_paragraph(self, node):
        pass

    def depart_paragraph(self, node):
        pass

    def visit_compound(self, node):
        pass

    def depart_compound(self, node):
        pass

    def visit_compact_paragraph(self, node):
        pass

    def depart_compact_paragraph(self, node):
        pass

    def visit_bullet_list(self, node):
        if self.node != None:
            self.parent = self.node

    def depart_bullet_list(self, node):
        if self.parent != None:
            self.parent = self.parent.getparent()


    def visit_list_item(self, node):
        pass

    def depart_list_item(self, node):
        pass

    def visit_reference(self, node):
        if node.get('anchorname') == '':
            self.node = etree.SubElement(self.parent, 'topicref', {'href':node.get('refuri')})

    def depart_reference(self, node):
        pass

