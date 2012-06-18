from lxml import etree
from docutils import nodes, writers
from os import path

XML_HEAD = u"""<?xml version='1.0' encoding='UTF-8'?>
<!DOCTYPE topic PUBLIC "-//OASIS//DTD DITA Topic//EN" "topic.dtd">
"""

class DitaWriter(writers.Writer):
    def __init__(self, builder):
        writers.Writer.__init__(self)
        self.builder = builder
        self.topics = etree.TreeBuilder()

    def translate(self):
        visitor = DitaTranslator(self.document, self.builder)
        self.document.walkabout(visitor)
        self.output = XML_HEAD
        self.output += visitor.body

class DitaTranslator(nodes.NodeVisitor):
    def __init__(self, document, builder):
        nodes.NodeVisitor.__init__(self, document)
        self.builder = builder
        self.tree = etree.TreeBuilder()
        # trace if we are inside a body element
        self.inBody = False
        # trace if we have an empty document
        self.hasContent = False

    def visit_document(self, node):
        pass

    def depart_document(self, node):
        if not self.hasContent:
            self.body = u'<topic id="none"></topic>'
        else:
            root = self.tree.close()
            self.body = etree.tostring(root, pretty_print=True)

    def visit_comment(self, node):
        raise nodes.SkipNode

    def depart_comment(self, node):
        pass

    def visit_Text(self, node):
        self.tree.data(node.astext())

    def depart_Text(self, node):
        pass

    def visit_section(self, node):
        if self.inBody:
            self.tree.end('body')
        self.inBody = False
        id = node.get('ids')[0]
        self.tree.start('topic', {'id':id})
        self.hasContent = True

    def depart_section(self, node):
        if self.inBody:
            self.tree.end('body')
        self.inBody = False
        self.tree.end('topic')

    def visit_title(self, node):
        self.tree.start('title', {})

    def depart_title(self, node):
        self.tree.end('title')
        self.tree.start('body', {})
        self.inBody = True

    def visit_paragraph(self, node):
        self.tree.start('p', {})

    def depart_paragraph(self, node):
        self.tree.end('p')

    def visit_compound(self, node):
        raise nodes.SkipNode

    def depart_compound(self, node):
        pass

    def visit_compact_paragraph(self, node):
        self.tree.start('p', {})

    def depart_compact_paragraph(self, node):
        self.tree.end('p')

    def visit_bullet_list(self, node):
        self.tree.start('ul', {})

    def depart_bullet_list(self, node):
        self.tree.end('ul')


    def visit_list_item(self, node):
        self.tree.start('li', {})

    def depart_list_item(self, node):
        self.tree.end('li')

    def visit_enumerated_list(self, node):
        self.tree.start('ol', {})

    def depart_enumerated_list(self, node):
        self.tree.end('ol')

    def visit_reference(self, node):
        refuri = node['refuri']
        format = ''
        if refuri.startswith('http://'):
            format = 'html'
        name, ext = path.splitext(node.get('refuri'))
        if ext:
            format = ext[1:]
        self.tree.start('xref', {'href':refuri, 'format':format})

    def depart_reference(self, node):
        self.tree.end('xref')

    def visit_emphasis(self, node):
        self.tree.start('i', {})

    def depart_emphasis(self, node):
        self.tree.end('i')

    def visit_strong(self, node):
        self.tree.start('b', {})

    def depart_strong(self, node):
        self.tree.end('b')

    def visit_literal(self, node):
        self.tree.start('tt', {})

    def depart_literal(self, node):
        self.tree.end('tt')

    def visit_target(self, node):
        raise nodes.SkipNode

    def depart_target(self, node):
        pass

    def visit_image(self, node):
        args = {}
        args['href'] = path.relpath(node['uri'], path.dirname(self.builder.docname))
        if node.has_key('align'):
            args['align'] = node['align']
        self.tree.start('image', args)

    def depart_image(self, node):
        self.tree.end('image')

    def visit_problematic(self, node):
        raise nodes.SkipNode

    def depart_problematic(self, node):
        pass

    def visit_title_reference(self, node):
        pass

    def depart_title_reference(self, node):
        pass

    def visit_rubric(self, node):
        self.tree.start('note', {'type':'notice'})

    def depart_rubric(self, node):
        self.tree.end('note')

    def visit_note(self, node):
        self.tree.start('note', {'type':'note'})

    def depart_note(self, node):
        self.tree.end('note')

    def visit_warning(self, node):
        self.tree.start('note', {'type':'warning'})

    def depart_warning(self, node):
        self.tree.end('note')

    def visit_literal_block(self, node):
        self.tree.start('codeblock', {})

    def depart_literal_block(self, node):
        self.tree.end('codeblock')

    def visit_table(self, node):
        self.tree.start('table', {})

    def depart_table(self, node):
        self.tree.end('table')

    def visit_tgroup(self, node):
        self.tree.start('tgroup', {'cols':str(node.get('cols'))})

    def depart_tgroup(self, node):
        self.tree.end('tgroup')

    def visit_tbody(self, node):
        self.tree.start('tbody', {})

    def depart_tbody(self, node):
        self.tree.end('tbody')

    def visit_thead(self, node):
        self.tree.start('thead', {})

    def depart_thead(self, node):
        self.tree.end('thead')

    def visit_colspec(self, node):
        self.tree.start('colspec', {})

    def depart_colspec(self, node):
        self.tree.end('colspec')

    def visit_row(self, node):
        self.tree.start('row', {})

    def depart_row(self, node):
        self.tree.end('row')

    def visit_entry(self, node):
        self.tree.start('entry', {})

    def depart_entry(self, node):
        self.tree.end('entry')

    def visit_definition_list(self, node):
        self.tree.start('dl', {})

    def depart_definition_list(self, node):
        self.tree.end('dl')

    def visit_definition_list_item(self, node):
        self.tree.start('dlentry', {})

    def depart_definition_list_item(self, node):
        self.tree.end('dlentry')

    def visit_term(self, node):
        self.tree.start('dt', {})

    def depart_term(self, node):
        self.tree.end('dt')

    def visit_definition(self, node):
        self.tree.start('dd', {})

    def depart_definition(self, node):
        self.tree.end('dd')

    def visit_footnote_reference(self, node):
        raise nodes.SkipNode

    def depart_footnote_reference(self, node):
        pass

    def visit_footnote(self, node):
        raise nodes.SkipNode

    def depart_footnote(self, node):
        pass

    def visit_label(self, node):
        raise nodes.SkipNode

    def depart_label(self, node):
        pass

    def visit_inline(self, node):
        print('inlines are not supported yet')
        raise nodes.SkipNode

    def depart_inline(self, node):
        pass

    def visit_seealso(self, node):
        print('seealsos are not supported yet')
        raise nodes.SkipNode

    def depart_seealso(self, node):
        pass

    def visit_topic(self, node):
        print('topics are not supported yet')
        raise nodes.SkipNode

    def depart_topic(self, node):
        pass

    def visit_block_quote(self, node):
        self.tree.start('lq', {})

    def depart_block_quote(self, node):
        self.tree.end('lq')

    def visit_line_block(self, node):
        self.tree.start('lines', {})

    def depart_line_block(self, node):
        self.tree.end('lines')

    def visit_line(self, node):
        pass

    def depart_line(self, node):
        self.tree.data('\n')
