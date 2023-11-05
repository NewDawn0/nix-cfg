package main
import (
    "os"
    "os/exec"
    "log"
    "github.com/google/uuid"
)

func main() {
    fname := uuid.New().String() + ".md"      // gen filename
    if _, err := os.Stat(fname); err == nil { // check if exist
        log.Fatalf("File %s already exists...\nAborting\n", fname)
    }
    file, err := os.Create(fname)             // create file
    if err != nil {                           // check for err
        log.Fatalf("Unable to create file %s...\nRecieved error: %v", fname, err)
    }
    defer file.Close()                        // close file

    editor := os.Getenv("EDITOR")             // Get editor 
    if editor == "" {                         // if not set use vim
        editor = "vim"
    }

    cmd := exec.Command(editor, fname)        // Set command to open file with editor
    cmd.Stdin = os.Stdin                      // Set stdin, stdout, stderr
    cmd.Stdout = os.Stdout
    cmd.Stderr = os.Stderr

    if err := cmd.Run(); err != nil {         // Run command and check for error
        log.Fatalf("Unable to open temporary `%s` with %s...\nRecieved error: %v", fname, editor, err)
    }

    if err := os.Remove(fname); err != nil {
        log.Fatalf("Unable to remove temporary file `%s`...\nRecieved error: %v", fname, err)
    }
}
