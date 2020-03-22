from http.server import BaseHTTPRequestHandler, HTTPServer
import socketserver
import json
import cgi
import urllib.parse

#Класс (json_name_workspace) - с строковыми константами для отправки/парсинга в джейсоне
class  jsnw():
    class method():
        handshake = ["handshake"]
        is_api_alive = ["isApiAlive"]

    str_result = "result"
    str_result_description = "resultDescription"
    str_resultCode = "resultCode"

class Server(BaseHTTPRequestHandler):
    def _set_headers(self):
        self.send_response(200)
        self.send_header('Content-type', 'application/json')
        self.end_headers()

    def do_HEAD(self):
        self._set_headers()

    # GET sends back a Hello world message
    def do_GET(self):
        self._set_headers()
        self.parse_parameters_and_run_API_method()
	
	#===================================================================================================================
	#
	#													Api Methods
	#
	#===================================================================================================================

    def parse_parameters_and_run_API_method(self):
        parameters_string = self.path[2:]
        # Словарь с параметрами
        parameters_dict = urllib.parse.parse_qs(parameters_string)
        print(parameters_dict)
        # Проверяем не пустые ли параметры
        if parameters_string != "" :
            # Проверяем метод API, который надо запустить
            if parameters_dict["method"] == jsnw.method.handshake:
                self.wfile.write(json.dumps({
                    jsnw.str_resultCode: "1",
                    jsnw.str_result_description: "Success.",
                    jsnw.str_result: [parameters_dict["users"]]}).encode())
            # Если параметр "method" не является одним из доступных списка API
            else :
                self.make_response_with_not_enought_params()
        # Если нет параметров
        else :
            self.wfile.write(json.dumps({
                jsnw.str_resultCode: "0",
                jsnw.str_result_description: "Success with nothing (No parameters given)." }).encode())

    def make_response_with_not_enought_params(self):
        self.wfile.write(json.dumps({
                    jsnw.str_resultCode: "-1",
                    jsnw.str_result_description: "Can not resolve request with this paramters." }).encode())

	#===================================================================================================================
	#
	#									Do not Change File under that braket
	#
	#===================================================================================================================
    # POST echoes the message adding a JSON field
    def do_POST(self):
        ctype, pdict = cgi.parse_header(self.headers.getheader('content-type'))

        # refuse to receive non-json content
        if ctype != 'application/json':
            self.send_response(400)
            self.end_headers()
            return

        # read the message and convert it into a python dictionary
        length = int(self.headers.getheader('content-length'))
        message = json.loads(self.rfile.read(length))

        # add a property to the object, just to mess with data
        message['received'] = 'ok'

        # send the message back
        self._set_headers()
        self.wfile.write(json.dumps(message))


def run(server_class=HTTPServer, handler_class=Server, port=8088):
    server_address = ('', port)
    httpd = server_class(server_address, handler_class)

    print('Starting httpd on port ' + str(port))
    httpd.serve_forever()


if __name__ == "__main__":
    from sys import argv

    if len(argv) == 2:
        run(port=int(argv[1]))
    else:
        run()
