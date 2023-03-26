; ModuleID = 'src/string/strchrnul.c'
source_filename = "src/string/strchrnul.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@strchrnul = weak alias i8* (i8*, i32), i8* (i8*, i32)* @__strchrnul

; Function Attrs: nounwind strictfp
define hidden i8* @__strchrnul(i8* noundef %0, i32 noundef %1) #0 {
  %3 = and i32 %1, 255
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %15, label %5

5:                                                ; preds = %2
  %6 = ptrtoint i8* %0 to i64
  %7 = and i64 %6, 7
  %8 = icmp eq i64 %7, 0
  br i1 %8, label %90, label %9

9:                                                ; preds = %5
  %10 = trunc i32 %1 to i8
  %11 = load i8, i8* %0, align 1, !tbaa !3
  %12 = icmp eq i8 %11, 0
  %13 = icmp eq i8 %11, %10
  %14 = or i1 %12, %13
  br i1 %14, label %129, label %18

15:                                               ; preds = %2
  %16 = tail call i64 @strlen(i8* noundef %0) #2
  %17 = getelementptr inbounds i8, i8* %0, i64 %16
  br label %129

18:                                               ; preds = %9
  %19 = getelementptr inbounds i8, i8* %0, i64 1
  %20 = ptrtoint i8* %19 to i64
  %21 = and i64 %20, 7
  %22 = icmp eq i64 %21, 0
  br i1 %22, label %90, label %23

23:                                               ; preds = %18
  %24 = load i8, i8* %19, align 1, !tbaa !3
  %25 = icmp eq i8 %24, 0
  %26 = icmp eq i8 %24, %10
  %27 = or i1 %25, %26
  br i1 %27, label %129, label %28

28:                                               ; preds = %23
  %29 = getelementptr inbounds i8, i8* %0, i64 2
  %30 = ptrtoint i8* %29 to i64
  %31 = and i64 %30, 7
  %32 = icmp eq i64 %31, 0
  br i1 %32, label %90, label %33

33:                                               ; preds = %28
  %34 = load i8, i8* %29, align 1, !tbaa !3
  %35 = icmp eq i8 %34, 0
  %36 = icmp eq i8 %34, %10
  %37 = or i1 %35, %36
  br i1 %37, label %129, label %38

38:                                               ; preds = %33
  %39 = getelementptr inbounds i8, i8* %0, i64 3
  %40 = ptrtoint i8* %39 to i64
  %41 = and i64 %40, 7
  %42 = icmp eq i64 %41, 0
  br i1 %42, label %90, label %43

43:                                               ; preds = %38
  %44 = load i8, i8* %39, align 1, !tbaa !3
  %45 = icmp eq i8 %44, 0
  %46 = icmp eq i8 %44, %10
  %47 = or i1 %45, %46
  br i1 %47, label %129, label %48

48:                                               ; preds = %43
  %49 = getelementptr inbounds i8, i8* %0, i64 4
  %50 = ptrtoint i8* %49 to i64
  %51 = and i64 %50, 7
  %52 = icmp eq i64 %51, 0
  br i1 %52, label %90, label %53

53:                                               ; preds = %48
  %54 = load i8, i8* %49, align 1, !tbaa !3
  %55 = icmp eq i8 %54, 0
  %56 = icmp eq i8 %54, %10
  %57 = or i1 %55, %56
  br i1 %57, label %129, label %58

58:                                               ; preds = %53
  %59 = getelementptr inbounds i8, i8* %0, i64 5
  %60 = ptrtoint i8* %59 to i64
  %61 = and i64 %60, 7
  %62 = icmp eq i64 %61, 0
  br i1 %62, label %90, label %63

63:                                               ; preds = %58
  %64 = load i8, i8* %59, align 1, !tbaa !3
  %65 = icmp eq i8 %64, 0
  %66 = icmp eq i8 %64, %10
  %67 = or i1 %65, %66
  br i1 %67, label %129, label %68

68:                                               ; preds = %63
  %69 = getelementptr inbounds i8, i8* %0, i64 6
  %70 = ptrtoint i8* %69 to i64
  %71 = and i64 %70, 7
  %72 = icmp eq i64 %71, 0
  br i1 %72, label %90, label %73

73:                                               ; preds = %68
  %74 = load i8, i8* %69, align 1, !tbaa !3
  %75 = icmp eq i8 %74, 0
  %76 = icmp eq i8 %74, %10
  %77 = or i1 %75, %76
  br i1 %77, label %129, label %78

78:                                               ; preds = %73
  %79 = getelementptr inbounds i8, i8* %0, i64 7
  %80 = ptrtoint i8* %79 to i64
  %81 = and i64 %80, 7
  %82 = icmp eq i64 %81, 0
  br i1 %82, label %90, label %83

83:                                               ; preds = %78
  %84 = load i8, i8* %79, align 1, !tbaa !3
  %85 = icmp eq i8 %84, 0
  %86 = icmp eq i8 %84, %10
  %87 = or i1 %85, %86
  br i1 %87, label %129, label %88

88:                                               ; preds = %83
  %89 = getelementptr inbounds i8, i8* %0, i64 8
  br label %90

90:                                               ; preds = %18, %28, %38, %48, %58, %68, %78, %88, %5
  %91 = phi i8* [ %0, %5 ], [ %19, %18 ], [ %29, %28 ], [ %39, %38 ], [ %49, %48 ], [ %59, %58 ], [ %69, %68 ], [ %79, %78 ], [ %89, %88 ]
  %92 = zext i32 %3 to i64
  %93 = mul nuw i64 %92, 72340172838076673
  %94 = bitcast i8* %91 to i64*
  %95 = load i64, i64* %94, align 8, !tbaa !3
  %96 = add i64 %95, -72340172838076673
  %97 = and i64 %95, -9187201950435737472
  %98 = xor i64 %97, -9187201950435737472
  %99 = and i64 %98, %96
  %100 = icmp eq i64 %99, 0
  br i1 %100, label %101, label %118

101:                                              ; preds = %90, %110
  %102 = phi i64 [ %112, %110 ], [ %95, %90 ]
  %103 = phi i64* [ %111, %110 ], [ %94, %90 ]
  %104 = xor i64 %102, %93
  %105 = add i64 %104, -72340172838076673
  %106 = and i64 %104, -9187201950435737472
  %107 = xor i64 %106, -9187201950435737472
  %108 = and i64 %107, %105
  %109 = icmp eq i64 %108, 0
  br i1 %109, label %110, label %118

110:                                              ; preds = %101
  %111 = getelementptr inbounds i64, i64* %103, i64 1
  %112 = load i64, i64* %111, align 8, !tbaa !3
  %113 = add i64 %112, -72340172838076673
  %114 = and i64 %112, -9187201950435737472
  %115 = xor i64 %114, -9187201950435737472
  %116 = and i64 %115, %113
  %117 = icmp eq i64 %116, 0
  br i1 %117, label %101, label %118

118:                                              ; preds = %101, %110, %90
  %119 = phi i64* [ %94, %90 ], [ %111, %110 ], [ %103, %101 ]
  %120 = bitcast i64* %119 to i8*
  %121 = trunc i32 %1 to i8
  br label %122

122:                                              ; preds = %122, %118
  %123 = phi i8* [ %120, %118 ], [ %128, %122 ]
  %124 = load i8, i8* %123, align 1, !tbaa !3
  %125 = icmp eq i8 %124, 0
  %126 = icmp eq i8 %124, %121
  %127 = or i1 %125, %126
  %128 = getelementptr inbounds i8, i8* %123, i64 1
  br i1 %127, label %129, label %122

129:                                              ; preds = %9, %23, %33, %43, %53, %63, %73, %83, %122, %15
  %130 = phi i8* [ %17, %15 ], [ %123, %122 ], [ %0, %9 ], [ %19, %23 ], [ %29, %33 ], [ %39, %43 ], [ %49, %53 ], [ %59, %63 ], [ %69, %73 ], [ %79, %83 ]
  ret i8* %130
}

declare i64 @strlen(i8* noundef) local_unnamed_addr #1

attributes #0 = { nounwind strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="none" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nobuiltin nounwind strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
