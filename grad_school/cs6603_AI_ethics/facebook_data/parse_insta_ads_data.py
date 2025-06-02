import json
import random

def has_non_ascii(text):
  return not all(ord(char) < 128 for char in text)

def __main__():
    file = open("../advertisers_using_your_activity_or_information.json", "r")
    data = json.load(file)
    ad_company_count = len(data["ig_custom_audiences_all_types"])

    companies = []
    i = 0
    seen = set()
    # 5% of 3917 = 195
    while i < 195:
        idx = random.randint(0, ad_company_count - 1)
        if idx in seen:
            continue
        seen.add(idx)
        name = data["ig_custom_audiences_all_types"][idx]["advertiser_name"]
        if has_non_ascii(name):
            continue
        i += 1
        companies.append(name)
    for company in companies:
        print(company)

__main__()
