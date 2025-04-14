from flask import Flask, request, jsonify
from models import Post, db
from db import init_db

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv('DATABASE_URL')
db.init_app(app)

@app.route('/posts', methods=['GET'])
def get_posts():
    return jsonify([post.to_dict() for post in Post.query.all()])

@app.route('/posts', methods=['POST'])
def create_post():
    data = request.get_json()
    post = Post(title=data['title'], content=data['content'])
    db.session.add(post)
    db.session.commit()
    return jsonify(post.to_dict()), 201

if __name__ == '__main__':
    with app.app_context():
        init_db()
    app.run(host='0.0.0.0', port=5000)

