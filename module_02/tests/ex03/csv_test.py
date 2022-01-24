from csvreader import CsvReader
import sys 

if len(sys.argv) == 2 and __name__ == "__main__":
    with eval(sys.argv[1]) as reader:
        if reader == None:
            print("File is corrupted or missing")
        else:
            print(reader.getheader(), end = "\n")
            print(reader.getdata(), end = "\n\n")