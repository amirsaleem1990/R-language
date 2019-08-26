import clipboard
clipboard.copy("# Q: " + clipboard.paste().replace('|', '').replace("\n", ''))