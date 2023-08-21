package common;
//순수하게 데이터저장기능만있는 클래스를 DTO(Data Transfer Object) 혹은 VO(Value Object) 플래스라고부른다.
public class Person {
//멤버변수 : 정보은닉위해 private으로 선언
	private String name;
	private int age;

	public Person() {} //기본(디폴트) 생성자
	//파라미터 생성자
	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}
//getter/setter 메소드 : private 멤버에 접근하기위한 메소드
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}		
}
