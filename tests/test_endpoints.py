import requests

def test_stage2_endpoint_unavailable():
    """
    This test checks that the /stage2 endpoint is not accessible.
    It assumes that your application is running locally (e.g., at http://localhost:8000).
    """
    url = "http://127.0.0.1:8000/stage2"
    try:
        response = requests.get(url, timeout=5)
    except requests.exceptions.RequestException as e:
        # If there's an error connecting, that might mean the server is down, so fail the test.
        assert False, f"Failed to reach the endpoint: {e}"

    # Expect a 404 Not Found (or another error status that indicates it's disabled)
    assert response.status_code == 404, "The /stage2 endpoint should not be available in CI."

