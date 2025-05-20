"""Tests for the app module."""

from project_name import hello


def test_hello() -> None:
    """Test the hello function.

    Raises
    ------
    AssertionError
        If the greeting does not match the expected value.

    """
    result = hello("World")
    if result != "Hello, World!":
        raise AssertionError(result)
