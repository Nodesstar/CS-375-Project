
class Ingredients extends React.Component {
    render () {
    return (
        <div className="container">
          <Menu />
        </div>
      )
    }
}

const Menu = () => {
    return (
      <div>
        <input type="checkbox" name="eggs" value="eggs"/>Eggs
        <input type="checkbox" name="pasta" value="pasta"/>Pasta
        <input type="checkbox" name="pecorino" value="pecorino"/>Pecorino
        <input type="checkbox" name="pepper" value="pepper"/>Pepper
        <input type="checkbox" name="bacon" value="bacon"/>Bacon
      </div>
    )
}

const domContainer = document.getElementById("ingredients");
const root = ReactDOM.createRoot(domContainer);
root.render(<Ingredients />);
/* 
const container = document.getElementById("root");
const root = createRoot(container);
root.render(<Ingredients />);
*/