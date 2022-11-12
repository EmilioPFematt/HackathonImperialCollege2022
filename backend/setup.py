from setuptools import find_packages, setup

setup (
    name = 'API',
    version = '1.0.0',
    pakages = find_packages(),
    include_package_data=True,
    install_requires=[
        'flask'
    ],
)