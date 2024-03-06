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

################
#### TESTER ####
################

### TESTER

TESTER_FOLDER	= auto_tests/

### FUNCHECK

FUNCHECK_FOLDER			= $(TESTER_FOLDER)/funcheck_dir/
FUNCHECK_REPO			= $(FUNCHECK_FOLDER)/funcheck/
FUNCHECK_FOLDER_LIB		= $(FUNCHECK_REPO)/library/
FUNCHECK_FOLDER_HOST	= $(FUNCHECK_REPO)/host
FUNCHECK_SCRIPT			= $(FUNCHECK_FOLDER)/run_tests.sh

# Cible pour construire tous les exécutables et les fichiers partagés
all: $(EXECS) $(SHARED_LIBS)

# Cible pour exécuter les tests
test:
	pytest $(TEST_DIR)

funcheck: all
	echo -e $(BLUE) "\n====> Building FUNCHECK TESTS <===="$(NC)"\n"
	$(MAKE) -sC $(FUNCHECK_FOLDER_LIB)
	$(MAKE) -sC $(FUNCHECK_FOLDER_HOST)
	$(FUNCHECK_SCRIPT)

# Cible pour nettoyer les fichiers objets, les exécutables et les fichiers partagés
clean:
	rm -rf $(OBJ_DIR) $(SHARED_DIR) $(EXECS)
	$(MAKE) -sC $(FUNCHECK_FOLDER_LIB) clean > /dev/null
	$(MAKE) -sC $(FUNCHECK_FOLDER_HOST) clean > /dev/null

fclean:
	$(MAKE) -sC $(FUNCHECK_FOLDER_LIB) fclean > /dev/null
	$(MAKE) -sC $(FUNCHECK_FOLDER_HOST) fclean > /dev/null

re 		: fclean
	echo -e $(YELLOW) "\nRebuilding..." $(NC)
	$(MAKE) -s