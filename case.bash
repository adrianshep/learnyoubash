#  case "$FRUIT" in
#    (apple)
#      echo 'Mmmmh... I like apple!'
#      ;;
#    (banana)
#      echo 'Hm, a bit awry, no?'
#      ;;
#    (orange|tangerine)
#      echo "I don't like it!" && exit 1
#    ;;
#    (*)
#    ;;
#  esac

#  In this exercise you will create a small image extensions checker. Using a
#  case statement, check if the first positional parameter is a jpeg (or
#  jpg), png, or gif extension. Output It is jpeg., It is png., or It is gif.
#  accordingly. Take care about cases when the positional argument contains
#  any other extension (print [EXT] is not an image! in these cases).

case "$1" in
  ("jpg"|"jpeg")
    echo "It is jpeg."
  ;;
  "png")
    echo "It is png."
  ;;
  "gif")
    echo "It is gif."
  ;;
  *)
    echo "$1 is not an image!"
  ;;
esac
