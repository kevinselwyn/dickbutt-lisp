#!/usr/bin/env clisp

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; screen clear
(defun cls()
    (format t "~A[H~@*~A[J" #\escape))

;; pretty print
(defun pretty-print(str)
    (format t "~d~%" str))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Library
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun load-lib()
    ;; dickbutt-lib
    (setf dickbutt-lib "./dickbutt-lib.so")

    ;; dickbutt_frame function
    (ffi:def-call-out dickbutt_frame
        (:arguments (index ffi:int))
        (:return-type ffi:c-string)
        (:language :c)
        (:library dickbutt-lib))

    ;; dickbutt_count function
    (ffi:def-call-out dickbutt_count
        (:return-type ffi:int)
        (:language :c)
        (:library dickbutt-lib)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;; Main
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun main(&optional (speed 0.05))
    (setf index 0)                                      ;; set index to 0
    (load-lib)                                          ;; load lib
    (loop do                                            ;; loop
        (cls)                                           ;; clear screen
        (pretty-print (dickbutt_frame index))           ;; print dickbutt frame
        (setf index (mod (+ 1 index) (dickbutt_count))) ;; increment index
        (sleep speed)))                                 ;; sleep

(main (if *args* (with-input-from-string
    (in (car *args*))
    (read in)) 0.05))
