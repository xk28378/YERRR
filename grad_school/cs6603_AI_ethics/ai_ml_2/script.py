from gensim.models import Word2Vec
import gensim.models
import nltk
model = gensim.models.KeyedVectors.load_word2vec_format("/Users/nehmy/Desktop/YERRR/grad_school/cs6603_AI_ethics/ai_ml_2/reducedvector.bin", binary=True)

words = [
    "wife",
    "husband",
    "child",
    "queen",
    "king",
    "man",
    "woman",
    "birth",
    "doctor",
    "nurse",
    "teacher",
    "professor",
    "engineer",
    "scientist",
    "president",
]

#comparing man
# for word in words:
#     print(model.similarity("man", word))
    
#comparing woman
# for word in words:
#     print(model.similarity("woman", word))
# file = open("/Users/nehmy/Downloads/BATS_3.0/BATS_3.0/2_Derivational_morphology/D01 [noun+less_reg].txt")

# lines = file.readlines()
# file.close()

# lines = [line.strip() for line in lines if line.strip()]

# for line in lines:
#     word = line.split()[0]
#     print(word, ",", model.similarity(word, "ethiopian"), ",", model.similarity(word, "american"), ",", model.similarity(word, "indian"))

# analogy_words = [
#     "judge-bench",
#     "genius-idiot",
#     "dean-warden",
#     "line-rectangle",
#     "French-Netherlands",
#     "king-queen",
#     "liquid-solid",
#     "sad-happy",
#     "teacher-school",
#     "pizza-sushi",
#     "house-kennel",
#     "grass-green",
#     "cassette-disk",
#     "planet-room",
#     "sickness-health"
# ]

# for words in analogy_words:
#     word1, word2 = words.split("-")
#     print(model.similarity(word1.lower(), word2.lower()))
    
model_analogy = [
    "king-throne-judge-bench",
    "giant-dwarf-genius-idiot",
    "college-dean-jail-warden",
    "arc-circle-line-rectangle",
    "French-France-Dutch-Netherlands",
    "man-woman-king-queen",
    "water-ice-liquid-solid",
    "bad-good-sad-happy",
    "nurse-hospital-teacher-school",
    "usa-pizza-japan-sushi",
    "human-house-dog-kennel",
    "grass-green-sky-blue",
    "video-cassette-computer-disk",
    "universe-planet-house-room",
    "poverty-wealth-sickness-health"
]

for words in model_analogy:
    word1, word2, word3, word4 = words.split("-")
    result = model.most_similar(positive=[word3.lower(), word2.lower()], negative=[word1.lower()], topn=1)
    print(result[0][0], ",", result[0][1])
