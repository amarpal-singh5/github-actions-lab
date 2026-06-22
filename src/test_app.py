import app as app_module

def test_health():
    """Asserts that the /health endpoint returns a 200 OK status."""
    client = app_module.app.test_client()
    response = client.get("/health")
    assert response.status_code == 200

def test_home():
    """Asserts that the root endpoint returns 200 OK and the correct welcome message."""
    client = app_module.app.test_client()
    response = client.get("/")
    
    # Check that the HTTP status code is a successful 200
    assert response.status_code == 200
    
    # Check that the page content matches your Flask app's return string
    # Note: Flask test client returns data as bytes, so we use b"your text"
    assert b"Hello" in response.data
