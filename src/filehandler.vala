/**
 * Class to handle file operations
 * @author Sebastian Giese
 */

namespace Vocabtrainer {
    public class FileHandler : Object {
        private File file;

        public FileHandler () {
            file = File.new_for_path("Projekte/VocabTrainer/data/fi-de.vocab");
        }


        public List<Vocabulary> read_file() throws Error {
            List<Vocabulary> lst_fileContent;

            try {
                lst_fileContent = new List<Vocabulary>();
                var dis = new DataInputStream(file.read());
                string line;

                while((line = dis.read_line()) != null) {
                    string[] splitter = line.split(";");
                    lst_fileContent.append(new Vocabulary(splitter[0], splitter[1]));
                }
            } catch(Error e) {
                throw e;
            }

            return lst_fileContent;
        }
    }
}