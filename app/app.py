import os
from http.server import HTTPServer, BaseHTTPRequestHandler

name = os.getenv("STUDENT_NAME", "Unknown")
surname = os.getenv("STUDENT_SURNAME", "Unknown")
group = os.getenv("STUDENT_GROUP", "Unknown")
student_id = os.getenv("STUDENT_ID", "Unknown")
port = int(os.getenv("APP_PORT", "5000"))

text = f"""================================
DevOps Student Application
================================

Name: {name}
Surname: {surname}
Group: {group}
Student ID: {student_id}

Application is running successfully!
"""

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header("Content-Type", "text/plain; charset=utf-8")
        self.end_headers()
        self.wfile.write(text.encode())

    def log_message(self, format, *args):
        print("Request received:", self.path, flush=True)

print(text, flush=True)
print(f"Web server is listening on port {port}", flush=True)
HTTPServer(("0.0.0.0", port), Handler).serve_forever()
