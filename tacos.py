from flask import Flask
app = Flask(__name__)


@app.route('/')
def hello():
    return '<img src="https://i.imgur.com/MK8J4PP.gif"><iframe style="width:0;height:0;border:0; border:none;" width="640" height="360" src="https://www.youtube.com/embed/eB5tKtRdWN0?rel=0&autoplay=1" frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>', "819 Bad Taco! \xf0\x9f\x8c\xae &#x1f32e;"

@app.route('/healthz')
def health():
    return 'ok'

if __name__ == '__main__':
    app.run(host="0.0.0.0", port=8080)
