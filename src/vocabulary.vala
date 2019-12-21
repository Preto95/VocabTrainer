/**
 * Class which defines Vocabularies in this app
 * @author Sebastian Giese
 */
namespace Vocabtrainer {
    public class Vocabulary : Object {

        public static List<Vocabulary> lst_vocabs;
        private string _origin;
        private string _translation;


        public Vocabulary (string origin, string translation) {
            origin = origin;
            translation = translation;
        }

        /**
         * Class properties
         */
        public string origin { private set; get; }
        public string translation { private set; get; }

        /**
         * Checks if the given translation is correct
         */
        public bool check(string to_check) {
            if (to_check == translation)
                return true;

            else
                return false;
        }

        /**
         * Output from this class in string format
         */
        public string to_string() {
            return origin + ";" + translation;
        }
    }

}