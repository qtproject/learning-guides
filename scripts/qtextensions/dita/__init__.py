def setup(app):
    try: # check first if lxml is installed
        import lxml
    except ImportError:
        print('\nWARNING: dita export needs python-lxml module installed.\n')
        return
    from ditabuilder import DitaBuilder
    app.add_builder(DitaBuilder)

