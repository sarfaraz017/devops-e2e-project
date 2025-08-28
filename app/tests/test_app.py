
from app import app
import json

def test_root():
    client = app.test_client()
    r = client.get('/')
    assert r.status_code == 200
    data = json.loads(r.data)
    assert 'message' in data

def test_health():
    client = app.test_client()
    r = client.get('/healthz')
    assert r.status_code == 200
    data = json.loads(r.data)
    assert data['status'] == 'ok'
