package com.epam.info_handling.entity;

import com.epam.info_handling.action.PolishNotationAnalyzer;
import com.epam.info_handling.exception.InvalidIndexException;
import com.epam.info_handling.interpretator.ByteExpression;
import com.epam.info_handling.interpretator.ByteExpressionCalculator;
import com.epam.info_handling.interpretator.PolishNotationParser;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class TextComponentImpl implements TextComponent {

    private List<TextComponent> components = new ArrayList<>();
    private TextElement textElement;


    public TextComponentImpl(final TextElement element) {
        this.textElement = element;
    }

    public void add(final TextComponent... textComponents) {
        this.components.addAll(Arrays.asList(textComponents));
    }

    public void add(final TextComponent component) {
        components.add(component);
    }

    public void remove(final TextComponent component) {
        components.remove(component);
    }

    public void remove(final TextComponent... textComponents) {
        this.components.removeAll(Arrays.asList(textComponents));
    }

    public TextComponent getChild(final int index)
            throws InvalidIndexException {
        if (index < 0 || index >= components.size()) {
            throw new InvalidIndexException("Index out of bound.");
        }
        return components.get(index);
    }

    public TextElement getTextElement() {
        return textElement;
    }

    @Override
    public String toString() {
        StringBuilder builder = new StringBuilder();
        for (TextComponent component : components) {
            builder.append(component.toString());
        }
        switch (textElement) {
            case EXPRESSION:
                String polishNotation = new PolishNotationAnalyzer()
                        .analyzeAndGet(builder.toString());
                List<ByteExpression> expressionList = new PolishNotationParser()
                        .parse(polishNotation);
                builder = new StringBuilder(
                        String.valueOf((int) new ByteExpressionCalculator()
                                .handleExpression(expressionList)));
                break;
            case LEXEME:
                builder.append(" ");
                break;
            case PARAGRAPH:
                builder.append("\n   ");
                break;
            case TEXT:
                builder = builder.reverse().append("   ").reverse();
            default:
        }
        return builder.toString();
    }
}
