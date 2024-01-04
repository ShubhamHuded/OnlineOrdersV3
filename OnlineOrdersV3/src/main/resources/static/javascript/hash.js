/** Used to stand-in for `undefined` hash values. */
const HASH_UNDEFINED = '__hash_undefined__'

export default class Hash {


  /**
   * Removes all key-value entries from the hash.
   *
   * @memberOf Hash
   */
  static clear() {
    Hash.__data__ = Object.create(null)
    Hash.size = 0
  }
  
  static __data__ = {};

  /**
   * Removes `key` and its value from the hash.
   *
   * @memberOf Hash
   * @param {string} key The key of the value to remove.
   * @returns {boolean} Returns `true` if the entry was removed, else `false`.
   */
  static delete(key) {
    const result = Hash.has(key) && delete Hash.__data__[key]
    Hash.size -= result ? 1 : 0
    return result
  }

  /**
   * Gets the hash value for `key`.
   *
   * @memberOf Hash
   * @param {string} key The key of the value to get.
   * @returns {*} Returns the entry value.
   */
  static get(key) {
    const data = Hash.__data__
    const result = data[key]
    return result === HASH_UNDEFINED ? undefined : result
  }

  /**
   * Checks if a hash value for `key` exists.
   *
   * @memberOf Hash
   * @param {string} key The key of the entry to check.
   * @returns {boolean} Returns `true` if an entry for `key` exists, else `false`.
   */
  static has(key) {
    let data = Hash.__data__
    return data[key] !== undefined
  }

  /**
   * Sets the hash `key` to `value`.
   *
   * @memberOf Hash
   * @param {string} key The key of the value to set.
   * @param {*} value The value to set.
   * @returns {Object} Returns the hash instance.
   */
  static set(key, value) {
    const data = Hash.__data__
    Hash.size += Hash.has(key) ? 0 : 1
    data[key] = value === undefined ? HASH_UNDEFINED : value
    return Hash
  }
}

