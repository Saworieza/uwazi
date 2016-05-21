# Be sure to restart your server when you modify this file.

Mime::Type.unregister(:pdf)
Mime::Type.register "application/force-download", :pdf, [], %w(pdf)