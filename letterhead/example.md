---
author: Nom de Plume
phone: "+666666666"
email: | 
  nom dot plume  
  (at) templates  
  dot com
address: |
  Long address  
  with multiple lines  
  MA, USA
addressTo: |
  Letter Recipient  
  From some other place  
  MA, USA
url: www.example.com
---

# Dear Letter Recipient

This is an example document of the template, showing its options that can be toggled using the YAML metadata. `Phone, email, address,` and `url` are optional, replace their value with an empty string (`''`) if they're not used to suppress them in the output.

Options available:

- title: Title of the document in the header
- author: Author's (pen)name
- booktitle: Title of the book
- phone: (Public) phone number
- email: (Public) email address
- address: (Public) address
- url: Link to a website

In case the `image` directory contains a `logo` file that file is typeset in the upper right corner of the letter page (first page). If not, it is replaced by the author's name.

## Sincerely,

Nom de Plume
