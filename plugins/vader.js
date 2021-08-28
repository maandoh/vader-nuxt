import vader from 'vader-sentiment';

export default ({app}, inject) => {
  inject('vader', vader)
}
