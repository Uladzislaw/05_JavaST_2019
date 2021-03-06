package com.epam.threads.exception;

/**
 * Extended class exception to avoid situation when argument of func it null.
 */
public class NullArgumentException extends Exception {
    /**
     * Constructor.
     */
    public NullArgumentException() {
    }

    /**
     * Set a message for logging exception.
     *
     * @param message exception message.
     */
    public NullArgumentException(final String message) {
        super(message);
    }
}
