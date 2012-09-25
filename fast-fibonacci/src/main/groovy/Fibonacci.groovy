/**
 * Solucion completa y test en: https://github.com/rchavarria/solveet-problems/tree/master/fast-fibonacci
 */
class Fibonacci {
	
	def recursive(n) {
		if(n == 0) 0
    	else if(n == 1) 1
    	else recursive(n - 1) + recursive(n - 2)
	}
}