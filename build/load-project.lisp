;;; Set up the local quicklisp install if present else rely on asdf.
(let ((quicklisp-init (merge-pathnames "../quicklisp/setup.lisp"
                                       *load-pathname*)))
  (when (probe-file quicklisp-init)
    (format *trace-output* "Found local quicklisp install.~%")
    (load quicklisp-init)))

(require :asdf)

(push (truename (merge-pathnames "../"
                                 (make-pathname :name nil :type nil
                                                :defaults *load-pathname*)))
      asdf:*central-registry*)

(ql:quickload :alexandria)
(ql:quickload :cl-csv)
(ql:quickload :mgl-example)
(ql:quickload :external-program)

(asdf:load-system :rumcajsz)
