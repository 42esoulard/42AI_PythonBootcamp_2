class Account(object):
    ID_COUNT = 1

    def __str__(self):
        res = ' --- ACCOUNT INFO: ---\n'
        for key in self.__dict__:
            res += key + ':' + str(self.__dict__[key]) + '\n'
        return res

    def __init__(self, name, **kwargs):
        self.id = self.ID_COUNT
        self.name = name
        self.__dict__.update(kwargs)
        Account.ID_COUNT += 1

    def transfer(self, amount):
        self.value += amount


class Bank(object):
    """The bank"""
    def __init__(self):
        self.account = []

    def add(self, account):
        if isinstance(account, Account) \
             and account not in self.account:
            self.account.append(account)

    def transfer(self, origin, dest, amount):
        """
            @origin: int(id) or str(name) of the first account
            @dest: int(id) or str(name) of the destination account
            @amount: float(amount) amount to transfer
            @return True if success, False if an error occured
        """

        # check validity of both accounts, attempt fix.
        # if fix failed, return
        o_account = self.get_account(origin)
        d_account = self.get_account(dest)

        if not o_account or not d_account:
            return False
        if not self.is_valid(o_account) or not self.is_valid(d_account):
            return False
        if amount < 0 or o_account.value < amount:
            return False
        o_account.transfer(-amount)
        d_account.transfer(amount)

        return True

    def get_account(self, account):
        """@account: int(id) or str(name) of the account"""

        cur_account = None
        for elem in self.account:
            if (isinstance(account, int) and account == elem.id) or \
               (isinstance(account, str) and account == elem.name):
                cur_account = elem
                break
        return cur_account

    def is_valid(self, account):

        # check attributes according to subject specifications
        attributes = list(account.__dict__)
        if len(attributes) % 2 == 0 \
            or len(list(filter(lambda n: n.startswith('b'), attributes))) \
            or (not len(list(filter(lambda n: n.startswith('zip'),
                                    attributes)))
                and not len(list(filter(lambda n: n.startswith('addr'),
                                        attributes)))) \
            or 'name' not in attributes \
            or 'id' not in attributes \
                or 'value' not in attributes:
            return False
        return True

    def fix_account(self, account):
        """
            fix the corrupted account
            @account: int(id) or str(name) of the account
            @return True if success, False if an error occured
        """

        cur_account = self.get_account(account)
        if not cur_account:
            return False
        attributes = list(cur_account.__dict__)

        # remove attributes starting with 'b'
        b_start = list(filter(lambda n: n.startswith('b'), attributes))
        if len(b_start):
            for corrupt_elem in b_start:
                cur_account.__dict__.pop(corrupt_elem)
                attributes.remove(corrupt_elem)

        # add either an attribute starting with 'zip' or with 'addr'
        if not len(list(filter(lambda n: n.startswith('zip'),
                               attributes))) and
        not len(list(filter(lambda n: n.startswith('addr'),
                            attributes))):
            cur_account.__dict__['zip'] = 12345

        # add 'name', 'id', and 'value' attributes if necessary
        if 'name' not in attributes:
            cur_account.__dict__['name'] = 'El Dorado'
        if 'id' not in attributes:
            cur_account.__dict__['id'] = Account.ID_COUNT
            Account.ID_COUNT += 1
        if 'value' not in attributes:
            cur_account.__dict__['value'] = 0

        attributes = list(cur_account.__dict__)
        if len(attributes) % 2 == 0:
            for attr in attributes:
                if attr != 'name' and attr != 'id' and attr != 'value' \
                    and not attr.startswith('zip') \
                        and not attr.startswith('addr'):
                    cur_account.__dict__.pop(attr)
                    attributes.remove(attr)
                    break
        i = 0
        while len(cur_account.__dict__) % 2 == 0:
            if ('attr' + str(i)) not in cur_account.__dict__:
                cur_account.__dict__['attr' + str(i)] = ''
            i += 1

        return self.is_valid(cur_account)
