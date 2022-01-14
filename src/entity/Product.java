package entity;


	public class Product {

		private String name; 			// 名称
		private int num; 				// 数量

		public Product(String name, int num) {
			this.name = name;
			this.num = num;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public int getNum() {
			return num;
		}

		public void setNum(int num) {
			this.num = num;
		}

		@Override
		public String toString() {
			return "Product [name=" + name + ", num=" + num + "]";
		}
	}
