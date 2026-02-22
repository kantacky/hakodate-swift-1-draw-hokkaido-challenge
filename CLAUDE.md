# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## プロジェクト概要

北海道名物のジンギスカンBBQシーンをSwiftUIのShapeとViewのみで描画するSwift Packageライブラリ。外部依存なし。

## ビルドコマンド

```bash
swift build          # ビルド
swift build --clean  # クリーンビルド
```

テストは未構成。各Viewに `#Preview` ブロックがあるため、Xcodeのプレビューで視覚的に確認可能。

## 技術詳細

- **Swift Tools Version:** 6.2（strict concurrencyがデフォルトで有効）
- **対応プラットフォーム:** iOS 26+, macOS 26+
- **フレームワーク:** SwiftUIのみ — 画像アセットは使用せず、`Shape`・`View`・グラデーション・オーバーレイで全て描画

## アーキテクチャ

`GenghisKhanPartyView` がトップレベルの構成View。鍋の上にZStackで3つのレイヤーを重ねる:

1. **鍋** (`GenghisKhanPotView`) — 外枠の円、中央ドームのグラデーション、放射状スリット、取っ手を組み立てる
2. **もやし** (`BeanSproutView`) — マスクを使い外側の溝付近にランダム散布
3. **ラム肉** (`LambMeatView`) — 中央ドーム上にランダム散布

カスタム `Shape` 準拠の `SlitShape`・`HandleShape` が、`Path` を使って鍋の放射状の溝と左右の取っ手を描画する。

## Git運用

- 変更はその都度コミットする。
