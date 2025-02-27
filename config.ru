app = Proc.new {|env|
  case env['REQUEST_PATH']
  when '/'
    html = File.read('./index.html')
    [200, { 'content-type' => 'text/html' }, [html] ]
  when '/test.html'
    html = File.read('./test.html')
    [200, { 'content-type' => 'text/html' }, [html] ]
  when '/dist/browser.script.iife.js'
    js = File.read('./dist/browser.script.iife.js')
    [200, { 'content-type' => 'text/javascript' }, [js] ]
  when '/dist/app.wasm'
    js = File.read('./dist/app.wasm')
    [200, { 'content-type' => 'application/wasm' }, [js] ]
  when '/ruby.wasm'
    js = File.read('./ruby.wasm')
    [200, { 'content-type' => 'application/wasm' }, [js] ]
  else
    [404, {}, []]
  end
}

Rackup::Server.start app:app, Port: 9292
