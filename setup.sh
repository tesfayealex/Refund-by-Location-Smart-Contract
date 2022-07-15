#!/usr/bin/env python

"""The setup script."""

from setuptools import setup, find_packages

with open('README.md') as readme_file:
    readme = readme_file.read()

requirements = []

test_requirements = ['pytest>=3', ]

setup(
    author="Tesfaye Alemayehu",
    email="tesfayealemayehu27@gmail.com",
    python_requires='>=3.6',
    classifiers=[
        'Natural Language :: English',
    ],
    description="A Repository for Refund by location End To End Web 3",
    install_requires=,
    long_description=readme,
    include_package_data=True,
    keywords='tests',
    name='tests',
    packages=find_packages(include=[]),
    test_suite='tests',
    tests_require=test_requirements,
    url='https://github.com/tesfayealex/Refund-by-Location-Smart-Contract.git',
    version='0.1.0',
    zip_safe=False,
)