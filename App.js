import './App.css';
/* props : react에서 상태 저장하기위한 값으로 부모 컴포넌트가 자식 컴포넌트로 전달하는 읽기전용데이터를 말한다
전달시엔 html 속성처럼 기술
형식] <컴포넌트명 props속성명={속성값} /> */
function MyBody(props) {
  const liTag1 = [], liTag2 = [];

  for (let i = 0; i < props.propData1.length; i++) {
    console.log(props.propData1[i]);
    liTag1.push(<li key={i}>{props.propData1[i]}</li>);
  }

  let keyCnt = 0;
  for (let row of props.propData2) liTag2.push(<li key={keyCnt++}>{row}</li>);

  return (
    <ol>
      <li>프론트엔드</li>
      <ul>{liTag1}</ul>
      <li>백엔드엔드</li>
      <ul>{liTag2}</ul>
    </ol>
  );
}
function App() {
  const myData1 = ['HTML5', 'CSS3', 'JavaScript', 'jQuery'];
  const myData2 = ['Java', 'Oracle', 'JSP', 'Spring Boot', 'PHP'];

  return (
    <div className="App">
      <h2>React - Props 전달하기</h2>
      <MyBody propData1={myData1} propData2={myData2} />
    </div>
  );
}
export default App;
