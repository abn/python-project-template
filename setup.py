#!/usr/bin/env python
from setuptools import setup, find_packages

setup(
    name='package_name',
    version='0.0.1',
    description='',
    long_description='',
    author='Author',
    url='URL',

    dependency_links=[],

    install_requires=[
    ],

    #    license="",

    packages=find_packages('src'),
    package_dir={'': 'src'},

    include_package_data=True,

    #    test_suite="",

    classifiers=[
        'Programming Language :: Python',
    ],
)
