from clyngor import solve

model = next(solve('schedule_prova.cl').by_predicate)

# Stampa della lista di tuple
print(model)
