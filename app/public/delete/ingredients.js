var _createClass = function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ("value" in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; }();

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

var Ingredients = function (_React$Component) {
  _inherits(Ingredients, _React$Component);

  function Ingredients() {
    _classCallCheck(this, Ingredients);

    return _possibleConstructorReturn(this, (Ingredients.__proto__ || Object.getPrototypeOf(Ingredients)).apply(this, arguments));
  }

  _createClass(Ingredients, [{
    key: "render",
    value: function render() {
      return React.createElement(
        "div",
        { className: "container" },
        React.createElement(Menu, null)
      );
    }
  }]);

  return Ingredients;
}(React.Component);

var Menu = function Menu() {
  return React.createElement(
    "div",
    null,
    React.createElement("input", { type: "checkbox", name: "eggs", value: "eggs" }),
    "Eggs",
    React.createElement("input", { type: "checkbox", name: "pasta", value: "pasta" }),
    "Pasta",
    React.createElement("input", { type: "checkbox", name: "pecorino", value: "pecorino" }),
    "Pecorino",
    React.createElement("input", { type: "checkbox", name: "pepper", value: "pepper" }),
    "Pepper",
    React.createElement("input", { type: "checkbox", name: "bacon", value: "bacon" }),
    "Bacon"
  );
};

var domContainer = document.getElementById("ingredients");
var root = ReactDOM.createRoot(domContainer);
root.render(React.createElement(Ingredients, null));
/* 
const container = document.getElementById("root");
const root = createRoot(container);
root.render(<Ingredients />);
*/