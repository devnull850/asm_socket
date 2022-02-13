# Embedding ELF in a PDF

This project demonstrates the use of x86 assembly to create a socket connection to send HTTP requests and receive the HTTP responses to those requests. A simple HTTP server is written in Java to accept a GET request and return a blob of x86 assembly bytes that simply print 'Hello, World!' to the terminal. An ELF binary is then assembled and linked. The typical artifacts are removed to leave just the bare minimum (almost) required to run stably. The ELF binary is then to be placed in a PDF.
