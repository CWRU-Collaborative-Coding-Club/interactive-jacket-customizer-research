from flask import Flask, jsonify
from flask_cors import CORS
from dotenv import load_dotenv
import os

# Import routes
from routes import api

# Load environment variables
load_dotenv()

app = Flask(__name__)
CORS(app)

# Register blueprints
app.register_blueprint(api, url_prefix='/api')

# Create a directory for research data
os.makedirs('research_data', exist_ok=True)

if __name__ == '__main__':
    port = int(os.getenv('FLASK_PORT', 5001))
    debug = os.getenv('FLASK_DEBUG', 'True').lower() == 'true'
    app.run(host='0.0.0.0', port=port, debug=debug)