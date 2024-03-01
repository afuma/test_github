# Makefile

# Définition des dossiers
SRC_DIR := srcs
OBJ_DIR := objs
SHARED_DIR := shared
TEST_DIR := tests

# Liste des fichiers source
SRCS := $(wildcard $(SRC_DIR)/*.c)

# Noms des fichiers objets
OBJS := $(addprefix $(OBJ_DIR)/,$(notdir $(SRCS:.c=.o)))

# Noms des fichiers partagés
SHARED_LIBS := $(addprefix $(SHARED_DIR)/,$(notdir $(SRCS:.c=.so)))

# Noms des exécutables
EXECS := $(patsubst $(SRC_DIR)/%.c,%,$(SRCS))

# Cible par défaut
.DEFAULT_GOAL := all

# Créer les dossiers s'ils n'existent pas
$(shell mkdir -p $(OBJ_DIR) $(SHARED_DIR))

# Règle pour compiler les fichiers source en fichiers objets
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	gcc -c -o $@ $<

# Règle pour compiler les fichiers source en fichiers partagés
$(SHARED_DIR)/%.so: $(SRC_DIR)/%.c
	gcc -shared -o $@ $<

# Règle pour construire les exécutables
$(EXECS): $(OBJS)
	gcc -o $@ $^

# Cible pour construire tous les exécutables et les fichiers partagés
all: $(EXECS) $(SHARED_LIBS)

# Cible pour exécuter les tests
test:
	pytest $(TEST_DIR)

# Cible pour nettoyer les fichiers objets, les exécutables et les fichiers partagés
clean:
	rm -rf $(OBJ_DIR) $(SHARED_DIR) $(EXECS)
