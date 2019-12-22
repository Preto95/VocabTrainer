/**
 * Class which defines Vocabularies in this app
 * @author Sebastian Giese
 */
namespace Vocabtrainer {
    public class Vocabulary : Object {

        public static List<Vocabulary> lst_vocabs;
        private string origin;
        private string translation;


        public Vocabulary (string origin, string translation) {
            Origin = origin;
            Translation = translation;
        }

        /**
         * Class properties
         */
        public string Origin {
            private set { origin = value; }
            get { return origin; }
        }

        public string Translation
        {
            private set { translation = value; }
            get { return translation; }
        }

        /**
         * Checks if the given translation is correct
         */
        public bool check(string to_check) {
            if (to_check == Translation)
                return true;

            else
                return false;
        }

        /**
         * Output from this class in string format
         */
        public string to_string() {
            return Origin + ";" + Translation;
        }
    }

}