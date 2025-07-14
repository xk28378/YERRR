import pandas as pd
import matplotlib.pyplot as plt
import scipy.stats as stats

sex_orl = 'lesbian, gay, bisexual, transgender, trans, queer, lgbt, lgbtq, homosexual, straight, heterosexual'
sex = 'male, female, nonbinary'
race = 'black, white, african american, asian'
ethnicity = 'african, european, hispanic, latino, latina, latinx, mexican, canadian, american, indian, middle eastern, chinese, japanese'
religion = 'christian, muslim, jewish, buddhist, catholic, protestant, sikh, taoist'
age = 'old, older, young, younger, teenage, millenial, middle aged, elderly'
disability = 'blind, deaf, paralyzed'

df  = pd.read_csv('/Users/nehmy/Desktop/YERRR/grad_school/cs6603_AI_ethics/ai_ml/toxity_per_attribute.csv')

print(df.shape)
df.dropna(inplace=True)
cols = df.columns.tolist()
cols = [col for col in cols if col not in ['TOXICITY', 'Wiki_ID']]
df = df.loc[~(df[cols] == False).all(axis=1)]
print(df.shape)
count = 1
subgroup_ids = {}
mask = {}
for col in sex_orl.split(', '):
    subgroup_ids[col] = count
    mask[col] = True
    count += 1
    
count = 1
for col in sex.split(', '):
    subgroup_ids[col] = count
    mask[col] = True
    count += 1
    
count = 1
for col in race.split(', '):
    subgroup_ids[col] = count
    mask[col] = True
    count += 1

count = 1
for col in ethnicity.split(', '):
    subgroup_ids[col] = count
    mask[col] = True
    count += 1

count = 1
for col in religion.split(', '):
    subgroup_ids[col] = count
    mask[col] = True
    count += 1

count = 1
for col in age.split(', '):
    subgroup_ids[col] = count
    mask[col] = True
    count += 1
    
count = 1
for col in disability.split(', '):
    subgroup_ids[col] = count
    mask[col] = True
    count += 1

print(subgroup_ids)
df.replace(mask, subgroup_ids, inplace=True)
df.replace(False, 0, inplace=True)




df['sex_orl'] = 0
df['sex_orl'] = df[sex_orl.split(', ')].max(axis=1)

df['sex'] = 0
df['sex'] = df[sex.split(', ')].max(axis=1)

df['race'] = 0
df['race'] = df[race.split(', ')].max(axis=1)

df['ethnicity'] = 0
df['ethnicity'] = df[ethnicity.split(', ')].max(axis=1)

df['religion'] = 0
df['religion'] = df[religion.split(', ')].max(axis=1)

df['age'] = 0
df['age'] = df[age.split(', ')].max(axis=1)

df['disability'] = 0
df['disability'] = df[disability.split(', ')].max(axis=1)
    
    
def plot(group, label):
    x = []
    y = []
    z = []
    for col in group.split(', '):
        x.append(subgroup_ids[col])
        y.append(df[df[col] == subgroup_ids[col]]['TOXICITY'].mean())
        z.append(df[df[col] == subgroup_ids[col]]['TOXICITY'].std())
    # bars = plt.bar(x, y)'
    x.append(len(x) + 1)
    columns = group.split(', ')
    y.append(df[df['disability'] > 0]['TOXICITY'].mean())
    z.append(df[df['disability'] > 0]['TOXICITY'].std())
    
    x.append(len(x) + 1)
    y.append(df['TOXICITY'].mean())
    z.append(df['TOXICITY'].std())
    
    
    
    print(z)
    bars = plt.bar(x, y)
    stds = plt.bar(x,z)
    plt.ylabel('Toxicity')
    plt.xlabel("Group")
    plt.ylim(0,1.0)
    plt.xticks(x, columns + ["Disability", "Overall"], rotation=45)
    plt.tight_layout()
    plt.grid()
    plt.title(f'Mean Toxicity and Standard Deviation per Population Group')
    def format(value):
        return f'mean: {value:.2f}'
    plt.bar_label(bars, fmt=format)
    plt.bar_label(stds, fmt='std: %.2f')
    plt.legend(['Mean Toxicity', 'Standard Deviation'])
    plt.savefig(f'mean_toxicity_std_per_group.png', bbox_inches='tight')
    # plt.show()

#Correlation
# print("Sex Orientation Correlation:")
# print(stats.pearsonr(df['sex_orl'].astype(float).to_list(), df['TOXICITY'].astype(float).to_list()))
# plot(sex_orl, "Sex Orientation")

# print("Sex Correlation:")
# print(stats.pearsonr(df['sex'].astype(float).to_list(), df['TOXICITY'].astype(float).to_list()))
# plot(sex, "Sex")

# print("Race Correlation:")
# print(stats.pearsonr(df['race'].astype(float).to_list(), df['TOXICITY'].astype(float).to_list()))
# plot(race, "Race")

# print("Ethnicity Correlation:")
# print(stats.pearsonr(df['ethnicity'].astype(float).to_list(), df['TOXICITY'].astype(float).to_list()))
# plot(ethnicity, "Ethnicity")

# print("Religion Correlation:")
# print(stats.pearsonr(df['religion'].astype(float).to_list(), df['TOXICITY'].astype(float).to_list()))
# plot(religion, "Religion")

# print("Age Correlation:")
# print(stats.pearsonr(df['age'].astype(float).to_list(), df['TOXICITY'].astype(float).to_list()))
# plot(age, "Age")

# print("Disability Correlation:")
# print(stats.pearsonr(df['disability'].astype(float).to_list(), df['TOXICITY'].astype(float).to_list()))
plot(disability, "Disability")





