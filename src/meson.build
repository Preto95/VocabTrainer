vocabtrainer_sources = [
  'main.vala',
  'window.vala',
]

vocabtrainer_deps = [
  dependency('gio-2.0', version: '>= 2.50'),
  dependency('gtk+-3.0', version: '>= 3.22'),
]

gnome = import('gnome')

vocabtrainer_sources += gnome.compile_resources('vocabtrainer-resources',
  'vocabtrainer.gresource.xml',
  c_name: 'vocabtrainer'
)

executable('vocabtrainer', vocabtrainer_sources,
  vala_args: '--target-glib=2.50',  dependencies: vocabtrainer_deps,
  install: true,
)
