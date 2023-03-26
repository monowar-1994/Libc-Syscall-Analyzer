; ModuleID = 'src/network/dns_parse.c'
source_filename = "src/network/dns_parse.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind optsize strictfp
define hidden i32 @__dns_parse(i8* noundef %0, i32 noundef %1, i32 (i8*, i32, i8*, i32, i8*)* nocapture noundef readonly %2, i8* noundef %3) local_unnamed_addr #0 {
  %5 = icmp slt i32 %1, 12
  br i1 %5, label %148, label %6

6:                                                ; preds = %4
  %7 = getelementptr inbounds i8, i8* %0, i64 3
  %8 = load i8, i8* %7, align 1, !tbaa !3
  %9 = and i8 %8, 15
  %10 = icmp eq i8 %9, 0
  br i1 %10, label %11, label %148

11:                                               ; preds = %6
  %12 = getelementptr inbounds i8, i8* %0, i64 12
  %13 = getelementptr inbounds i8, i8* %0, i64 4
  %14 = load i8, i8* %13, align 1, !tbaa !3
  %15 = zext i8 %14 to i32
  %16 = shl nuw nsw i32 %15, 8
  %17 = getelementptr inbounds i8, i8* %0, i64 5
  %18 = load i8, i8* %17, align 1, !tbaa !3
  %19 = zext i8 %18 to i32
  %20 = or i32 %16, %19
  %21 = getelementptr inbounds i8, i8* %0, i64 6
  %22 = load i8, i8* %21, align 1, !tbaa !3
  %23 = zext i8 %22 to i32
  %24 = shl nuw nsw i32 %23, 8
  %25 = getelementptr inbounds i8, i8* %0, i64 7
  %26 = load i8, i8* %25, align 1, !tbaa !3
  %27 = zext i8 %26 to i32
  %28 = or i32 %24, %27
  %29 = add nuw nsw i32 %28, %20
  %30 = icmp ugt i32 %29, 64
  br i1 %30, label %148, label %31

31:                                               ; preds = %11
  %32 = icmp eq i32 %20, 0
  br i1 %32, label %45, label %33

33:                                               ; preds = %31
  %34 = ptrtoint i8* %0 to i64
  %35 = zext i32 %1 to i64
  %36 = getelementptr inbounds i8, i8* %0, i64 %35
  %37 = getelementptr inbounds i8, i8* %36, i64 -6
  br label %38

38:                                               ; preds = %33, %81
  %39 = phi i32 [ %20, %33 ], [ %41, %81 ]
  %40 = phi i8* [ %12, %33 ], [ %84, %81 ]
  %41 = add nsw i32 %39, -1
  %42 = ptrtoint i8* %40 to i64
  %43 = sub i64 %42, %34
  %44 = icmp slt i64 %43, %35
  br i1 %44, label %53, label %64

45:                                               ; preds = %81, %31
  %46 = phi i8* [ %12, %31 ], [ %84, %81 ]
  %47 = icmp eq i32 %28, 0
  br i1 %47, label %148, label %48

48:                                               ; preds = %45
  %49 = ptrtoint i8* %0 to i64
  %50 = sext i32 %1 to i64
  %51 = getelementptr inbounds i8, i8* %0, i64 %50
  %52 = getelementptr inbounds i8, i8* %51, i64 -6
  br label %86

53:                                               ; preds = %38, %59
  %54 = phi i8* [ %60, %59 ], [ %40, %38 ]
  %55 = load i8, i8* %54, align 1, !tbaa !3
  %56 = zext i8 %55 to i32
  %57 = add nsw i32 %56, -1
  %58 = icmp ult i32 %57, 127
  br i1 %58, label %59, label %67

59:                                               ; preds = %53
  %60 = getelementptr inbounds i8, i8* %54, i64 1
  %61 = ptrtoint i8* %60 to i64
  %62 = sub i64 %61, %34
  %63 = icmp slt i64 %62, %35
  br i1 %63, label %53, label %64

64:                                               ; preds = %59, %38
  %65 = phi i8* [ %40, %38 ], [ %60, %59 ]
  %66 = load i8, i8* %65, align 1, !tbaa !3
  br label %67

67:                                               ; preds = %53, %64
  %68 = phi i8* [ %65, %64 ], [ %54, %53 ]
  %69 = phi i8 [ %66, %64 ], [ %55, %53 ]
  %70 = icmp ugt i8 %69, -63
  br i1 %70, label %148, label %71

71:                                               ; preds = %67
  %72 = icmp eq i8 %69, -63
  br i1 %72, label %73, label %79

73:                                               ; preds = %71
  %74 = getelementptr inbounds i8, i8* %68, i64 1
  %75 = load i8, i8* %74, align 1, !tbaa !3
  %76 = icmp eq i8 %75, -1
  %77 = icmp ugt i8* %68, %37
  %78 = select i1 %76, i1 true, i1 %77
  br i1 %78, label %148, label %81

79:                                               ; preds = %71
  %80 = icmp ugt i8* %68, %37
  br i1 %80, label %148, label %81

81:                                               ; preds = %73, %79
  %82 = icmp eq i8 %69, 0
  %83 = select i1 %82, i64 5, i64 6
  %84 = getelementptr inbounds i8, i8* %68, i64 %83
  %85 = icmp eq i32 %41, 0
  br i1 %85, label %45, label %38

86:                                               ; preds = %48, %143
  %87 = phi i32 [ %28, %48 ], [ %89, %143 ]
  %88 = phi i8* [ %46, %48 ], [ %146, %143 ]
  %89 = add nsw i32 %87, -1
  %90 = ptrtoint i8* %88 to i64
  %91 = sub i64 %90, %49
  %92 = icmp slt i64 %91, %50
  br i1 %92, label %93, label %104

93:                                               ; preds = %86, %99
  %94 = phi i8* [ %100, %99 ], [ %88, %86 ]
  %95 = load i8, i8* %94, align 1, !tbaa !3
  %96 = zext i8 %95 to i32
  %97 = add nsw i32 %96, -1
  %98 = icmp ult i32 %97, 127
  br i1 %98, label %99, label %107

99:                                               ; preds = %93
  %100 = getelementptr inbounds i8, i8* %94, i64 1
  %101 = ptrtoint i8* %100 to i64
  %102 = sub i64 %101, %49
  %103 = icmp slt i64 %102, %50
  br i1 %103, label %93, label %104

104:                                              ; preds = %99, %86
  %105 = phi i8* [ %88, %86 ], [ %100, %99 ]
  %106 = load i8, i8* %105, align 1, !tbaa !3
  br label %107

107:                                              ; preds = %93, %104
  %108 = phi i8* [ %105, %104 ], [ %94, %93 ]
  %109 = phi i8 [ %106, %104 ], [ %95, %93 ]
  %110 = icmp ugt i8 %109, -63
  br i1 %110, label %148, label %111

111:                                              ; preds = %107
  %112 = icmp eq i8 %109, -63
  br i1 %112, label %113, label %119

113:                                              ; preds = %111
  %114 = getelementptr inbounds i8, i8* %108, i64 1
  %115 = load i8, i8* %114, align 1, !tbaa !3
  %116 = icmp eq i8 %115, -1
  %117 = icmp ugt i8* %108, %52
  %118 = select i1 %116, i1 true, i1 %117
  br i1 %118, label %148, label %121

119:                                              ; preds = %111
  %120 = icmp ugt i8* %108, %52
  br i1 %120, label %148, label %121

121:                                              ; preds = %113, %119
  %122 = icmp eq i8 %109, 0
  %123 = select i1 %122, i64 1, i64 2
  %124 = getelementptr inbounds i8, i8* %108, i64 %123
  %125 = getelementptr inbounds i8, i8* %124, i64 8
  %126 = load i8, i8* %125, align 1, !tbaa !3
  %127 = zext i8 %126 to i32
  %128 = shl nuw nsw i32 %127, 8
  %129 = getelementptr inbounds i8, i8* %124, i64 9
  %130 = load i8, i8* %129, align 1, !tbaa !3
  %131 = zext i8 %130 to i32
  %132 = or i32 %128, %131
  %133 = zext i32 %132 to i64
  %134 = getelementptr inbounds i8, i8* %124, i64 %133
  %135 = icmp ugt i8* %134, %51
  br i1 %135, label %148, label %136

136:                                              ; preds = %121
  %137 = getelementptr inbounds i8, i8* %124, i64 1
  %138 = load i8, i8* %137, align 1, !tbaa !3
  %139 = zext i8 %138 to i32
  %140 = getelementptr inbounds i8, i8* %124, i64 10
  %141 = tail call i32 %2(i8* noundef %3, i32 noundef %139, i8* noundef nonnull %140, i32 noundef %132, i8* noundef %0) #1
  %142 = icmp slt i32 %141, 0
  br i1 %142, label %148, label %143

143:                                              ; preds = %136
  %144 = add nuw nsw i32 %132, 10
  %145 = zext i32 %144 to i64
  %146 = getelementptr inbounds i8, i8* %124, i64 %145
  %147 = icmp eq i32 %89, 0
  br i1 %147, label %148, label %86

148:                                              ; preds = %67, %73, %79, %119, %113, %107, %121, %136, %143, %45, %11, %6, %4
  %149 = phi i32 [ -1, %4 ], [ 0, %6 ], [ -1, %11 ], [ 0, %45 ], [ -1, %119 ], [ -1, %113 ], [ -1, %107 ], [ -1, %121 ], [ -1, %136 ], [ 0, %143 ], [ -1, %79 ], [ -1, %73 ], [ -1, %67 ]
  ret i32 %149
}

attributes #0 = { nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nobuiltin nounwind optsize strictfp "no-builtins" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
