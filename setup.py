from setuptools import setup


setup(
    name="pre_commit_dummy_package",
    version="0.0.0",
    install_requires=[
        "autopep8==1.4.4",
        "black==19.3b0",
        "flake8",
        "isort==4.3.21",
        "pydocstyle",
        "pytest==4.6.4",
    ],
)
