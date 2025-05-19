"""Tests for the app module."""

from project_name import hello


def test_hello() -> None:
    """Test the hello function."""
    assert hello("World") == "Hello, World!"
