import rolandParte2.*

describe "(PARTE 2)"{

	const espadaDelDestino = new Arma()
	const mascaraOscura = new MascaraOscura(indiceDeOscuridad = 1)

	const rolando = new Personaje()

	fixture {

		collarDivino.perlas(5)

		rolando.agregaLosArtefactos([espadaDelDestino,collarDivino,mascaraOscura])


	}

	test"Si rolando NO TIENE artefactos, su habilidad de lucha es 1"{

		rolando.removeTodosLosArtefactos()

		assert.equals(rolando.valorDeLucha(),1)
	}

	test "Con sus artefactos por defecto, rolando tiene 13 de valor de lucha"{

		assert.equals(rolando.valorDeLucha(),13)
	}

	test "Si el collar tiene tres perlas, rolando pasa a tener 11 de valor de lucha"{

		collarDivino.perlas(3)

		assert.equals(rolando.valorDeLucha(),11)

	}

	test "El valor Base de rolando ahora es 8, por lo que su nivel de lucha es 20"{

		rolando.basePelea(8)

		assert.equals(rolando.valorDeLucha(),20)

	}

	test "Si ocurre un eclipse, el valor de lucha de la Mascara Oscura es de 5"{

		mundo.eclipse()

		assert.equals(mascaraOscura.unidadesDeLucha(rolando),5)

	}

	test "Si rolando se quita la mascara oscura, su valor de lucha es de 9"{

		rolando.removeArtefacto(mascaraOscura)

		assert.equals(rolando.valorDeLucha(),9)

	}

	test "Si la  Mascara (para nada) Oscura de Rolando tiene indiceDeOscuridad de 0, su valor de lucha  es 4"{

		const mascaraNoOscura = new MascaraOscura(indiceDeOscuridad = 0)

		assert.equals(mascaraNoOscura.unidadesDeLucha(rolando),4)

	}

	test "Si Tengo una Mascara con indice = 0, y un valor minimo de 2, su valor de lucha de la mascara de rolando es 2 "{

		const mascaraNoOscura = new MascaraOscura(indiceDeOscuridad = 0)

		mascaraNoOscura.minimoDePoder(2)

		assert.equals(mascaraNoOscura.unidadesDeLucha(rolando),2)
	}
}