class CsvReader():

    def __init__(self, filename=None, sep=',', header=False,
                 skip_top=0, skip_bottom=0):
        self.filename = filename
        self.file_obj = None
        self.sep = sep
        self.header = header
        self.skip_top = skip_top
        self.skip_bottom = skip_bottom

    def __enter__(self):
        try:
            self.file_obj = open(self.filename)
        except FileNotFoundError:
            return None

        ref = ''
        for line in self.file_obj.readlines()[1:]:
            if not ref:
                ref = line.split(self.sep)
            i = 0
            for col in line.split(self.sep):
                if (i >= len(ref)
                        or len(col) != len(ref[i])):
                    # print(f'{len(col)}[{col}] {len(ref[i])}[{ref[i]}]')
                    return None
                i += 1
        return self

    def __exit__(self, type, value, traceback):
        if self.file_obj:
            self.file_obj.close()

    def getdata(self):
        """ Retrieves the data/records from skip_top to skip bottom.
        Returns:
        nested list (list(list, list, ...)) representing the data.
        """
        self.file_obj.seek(0)
        if self.skip_bottom:
            return list(map(lambda n: n[:-1].split(self.sep),
                            self.file_obj.readlines()[self.skip_top:
                                                      self.skip_bottom]))
        return list(map(lambda n: n[:-1].split(self.sep),
                        self.file_obj.readlines()[self.skip_top:]))

    def getheader(self):
        """ Retrieves the header from csv file.
        Returns:
        list: representing the data (when self.header is True).
        None: (when self.header is False).
        """
        self.file_obj.seek(0)
        if not self.header:
            return None
        return self.file_obj.readline()[:-1].split(self.sep)
