def calcular_porcentagem(valor, total):
    """
    Calculates the percentage of `valor` in relation to `total`.

    Args:
        valor (float): The value for which the percentage is calculated.
        total (float): The total value.

    Returns:
        float: The calculated percentage.

    Raises:
        ValueError: If `total` is zero.
    """
    if total == 0:
        raise ValueError("Cannot calculate percentage when total is zero.")
    porcentagem = (valor / total) * 100
    return porcentagem

# Solicitar entrada do usuário
valor = float(input("Digite o valor: "))
total = float(input("Digite o total: "))

# Calcular e exibir a porcentagem
porcentagem = calcular_porcentagem(valor, total)
print(f"{valor} é {porcentagem}% de {total}.")