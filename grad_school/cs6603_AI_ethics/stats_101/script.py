import pandas as pd
import matplotlib.pyplot as plt




def getDeathKey(a):
    if 'Justified' in a:
        return 'Homicide Justified'
    elif 'Willful' in a:
        return 'Homicide Willful'
    elif 'Suicide' in a:
        return 'Suicide'
    elif 'Natural' in a:
        return 'Natural'
    elif 'Accidental' in a:
        return 'Accidental'
    else:
        return 'Other'
    
DEATH_TYPES = ['Homicide Justified', 'Homicide Willful', 'Suicide', 'Natural', 'Accidental', 'Other']

def getRaceKey(a):
    if 'White' in a:
        return 'White'
    elif 'Black' in a:
        return 'Black'
    elif 'Hispanic' in a:
        return 'Hispanic'
    else:
        return 'Other'
    
RACE_TYPES = ['White', 'Black', 'Hispanic', 'Other']

GENDER_TYPES = ['Male', 'Female']

def getAgeKey(a):
    try :
        a = int(a)
    except:
        return 'Unknown'
    if a < 18:
        return '0-17'
    elif a < 35:
        return '18-34'
    elif a < 60:
        return '35-59'
    else:
        return '60+'
AGE_TYPES = ['0-17', '18-34', '35-59', '60+']

def getCustodyStatusKey(a):
    if 'Booked' in a:
        return 'Booked'
    elif 'Sentenced' in a:
        return 'Sentenced'
    elif 'Process' in a:
        return 'Process of Arrest'
    else:
        return 'Other'

CUSTODY_TYPES = ['Booked', 'Sentenced', 'Process of Arrest', 'Other']

df  = pd.read_csv('/Users/nehmy/Desktop/YERRR/grad_school/cs6603_AI_ethics/stats_101/deaths-in-custody.csv')

df = df.sample(frac=0.5, replace=False, random_state=1)
param_a = 'race'
param_b = 'manner_of_death'

table = pd.DataFrame(columns=RACE_TYPES, index=DEATH_TYPES)


table.fillna(0, inplace=True)
seen = set()
race_count = {}
for index, row in df.iterrows():
    a = getRaceKey(row[param_a]) #row[param_a]
    if a not in RACE_TYPES:
        continue
    if a not in race_count:
        race_count[a] = 0
    race_count[a] += 1
    b = getDeathKey(row[param_b]) #row[param_b]
    table.loc[b, a] = table.loc[b, a] + 1


print(table.head())
print(race_count)

# y = []
# x = []
# for col in table.columns:
#     y.append(((table[col]['Homicide Justified'] + table[col]['Homicide Willful'] ) * 100) / table[col].sum())
#     x.append(col)
# plt.plot(x, y)
# plt.yscale('linear')
# plt.title('Percentage of Homicide Deaths to Total Deaths by Race')
# plt.xlabel('Race')
# plt.ylabel('Percentage of Homicide Deaths to Total Deaths')
# plt.show()
# print(table.head())
table.to_csv('death_type_by_race_sampled.csv')

hist = table.plot(kind='bar', title='Distribution of Manner of Death by Race (Sampled)', xlabel='Manner of Death', ylabel='Frequency Count', rot=45)
plt.grid(axis='y')
plt.tight_layout()
# plt.show()
plt.savefig('death_type_by_race_sampled.png')
