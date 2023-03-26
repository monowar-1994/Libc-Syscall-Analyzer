; ModuleID = 'src/math/remquo.c'
source_filename = "src/math/remquo.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nofree nosync nounwind optsize strictfp
define double @remquo(double noundef %0, double noundef %1, i32* nocapture noundef writeonly %2) local_unnamed_addr #0 {
  %4 = bitcast double %0 to i64
  %5 = lshr i64 %4, 52
  %6 = trunc i64 %5 to i32
  %7 = and i32 %6, 2047
  %8 = bitcast double %1 to i64
  %9 = lshr i64 %8, 52
  %10 = trunc i64 %9 to i32
  %11 = and i32 %10, 2047
  store i32 0, i32* %2, align 4, !tbaa !3
  %12 = and i64 %8, 9223372036854775807
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %18, label %14

14:                                               ; preds = %3
  %15 = icmp ugt i64 %12, 9218868437227405312
  %16 = icmp eq i32 %7, 2047
  %17 = or i1 %15, %16
  br i1 %17, label %18, label %22

18:                                               ; preds = %14, %3
  %19 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %20 = tail call double @llvm.experimental.constrained.fmul.f64(double %0, double %1, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %21 = tail call double @llvm.experimental.constrained.fdiv.f64(double %19, double %20, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  br label %164

22:                                               ; preds = %14
  %23 = and i64 %4, 9223372036854775807
  %24 = icmp eq i64 %23, 0
  br i1 %24, label %164, label %25

25:                                               ; preds = %22
  %26 = icmp eq i32 %7, 0
  br i1 %26, label %27, label %41

27:                                               ; preds = %25
  %28 = shl i64 %4, 12
  %29 = icmp sgt i64 %28, -1
  br i1 %29, label %30, label %36

30:                                               ; preds = %27, %30
  %31 = phi i64 [ %34, %30 ], [ %28, %27 ]
  %32 = phi i32 [ %33, %30 ], [ 0, %27 ]
  %33 = add nsw i32 %32, -1
  %34 = shl nuw i64 %31, 1
  %35 = icmp sgt i64 %34, -1
  br i1 %35, label %30, label %36

36:                                               ; preds = %30, %27
  %37 = phi i32 [ 0, %27 ], [ %33, %30 ]
  %38 = sub i32 1, %37
  %39 = zext i32 %38 to i64
  %40 = shl i64 %4, %39
  br label %44

41:                                               ; preds = %25
  %42 = and i64 %4, 4503599627370495
  %43 = or i64 %42, 4503599627370496
  br label %44

44:                                               ; preds = %41, %36
  %45 = phi i32 [ %7, %41 ], [ %37, %36 ]
  %46 = phi i64 [ %43, %41 ], [ %40, %36 ]
  %47 = icmp eq i32 %11, 0
  br i1 %47, label %48, label %62

48:                                               ; preds = %44
  %49 = shl i64 %8, 12
  %50 = icmp sgt i64 %49, -1
  br i1 %50, label %51, label %57

51:                                               ; preds = %48, %51
  %52 = phi i64 [ %55, %51 ], [ %49, %48 ]
  %53 = phi i32 [ %54, %51 ], [ 0, %48 ]
  %54 = add nsw i32 %53, -1
  %55 = shl nuw i64 %52, 1
  %56 = icmp sgt i64 %55, -1
  br i1 %56, label %51, label %57

57:                                               ; preds = %51, %48
  %58 = phi i32 [ 0, %48 ], [ %54, %51 ]
  %59 = sub i32 1, %58
  %60 = zext i32 %59 to i64
  %61 = shl i64 %8, %60
  br label %65

62:                                               ; preds = %44
  %63 = and i64 %8, 4503599627370495
  %64 = or i64 %63, 4503599627370496
  br label %65

65:                                               ; preds = %62, %57
  %66 = phi i64 [ %64, %62 ], [ %61, %57 ]
  %67 = phi i32 [ %11, %62 ], [ %58, %57 ]
  %68 = icmp slt i32 %45, %67
  br i1 %68, label %71, label %69

69:                                               ; preds = %65
  %70 = icmp sgt i32 %45, %67
  br i1 %70, label %74, label %89

71:                                               ; preds = %65
  %72 = add nsw i32 %45, 1
  %73 = icmp eq i32 %72, %67
  br i1 %73, label %109, label %164

74:                                               ; preds = %69, %74
  %75 = phi i64 [ %84, %74 ], [ %46, %69 ]
  %76 = phi i32 [ %86, %74 ], [ 0, %69 ]
  %77 = phi i32 [ %87, %74 ], [ %45, %69 ]
  %78 = sub i64 %75, %66
  %79 = lshr i64 %78, 63
  %80 = trunc i64 %79 to i32
  %81 = or i32 %76, %80
  %82 = icmp slt i64 %78, 0
  %83 = select i1 %82, i64 %75, i64 %78
  %84 = shl i64 %83, 1
  %85 = shl i32 %81, 1
  %86 = xor i32 %85, 2
  %87 = add nsw i32 %77, -1
  %88 = icmp sgt i32 %87, %67
  br i1 %88, label %74, label %89

89:                                               ; preds = %74, %69
  %90 = phi i32 [ %45, %69 ], [ %67, %74 ]
  %91 = phi i32 [ 0, %69 ], [ %86, %74 ]
  %92 = phi i64 [ %46, %69 ], [ %84, %74 ]
  %93 = sub i64 %92, %66
  %94 = lshr i64 %93, 63
  %95 = trunc i64 %94 to i32
  %96 = or i32 %91, %95
  %97 = xor i32 %96, 1
  %98 = icmp slt i64 %93, 0
  %99 = select i1 %98, i64 %92, i64 %93
  %100 = icmp eq i64 %99, 0
  br i1 %100, label %119, label %101

101:                                              ; preds = %89
  %102 = icmp ult i64 %99, 4503599627370496
  br i1 %102, label %103, label %109

103:                                              ; preds = %101, %103
  %104 = phi i64 [ %106, %103 ], [ %99, %101 ]
  %105 = phi i32 [ %107, %103 ], [ %90, %101 ]
  %106 = shl nuw nsw i64 %104, 1
  %107 = add nsw i32 %105, -1
  %108 = icmp ult i64 %104, 2251799813685248
  br i1 %108, label %103, label %109

109:                                              ; preds = %103, %101, %71
  %110 = phi i32 [ %45, %71 ], [ %90, %101 ], [ %107, %103 ]
  %111 = phi i32 [ 0, %71 ], [ %97, %101 ], [ %97, %103 ]
  %112 = phi i64 [ %46, %71 ], [ %99, %101 ], [ %106, %103 ]
  %113 = icmp sgt i32 %110, 0
  br i1 %113, label %114, label %119

114:                                              ; preds = %109
  %115 = add i64 %112, -4503599627370496
  %116 = zext i32 %110 to i64
  %117 = shl i64 %116, 52
  %118 = or i64 %115, %117
  br label %126

119:                                              ; preds = %89, %109
  %120 = phi i64 [ %112, %109 ], [ 0, %89 ]
  %121 = phi i32 [ %111, %109 ], [ %97, %89 ]
  %122 = phi i32 [ %110, %109 ], [ -60, %89 ]
  %123 = sub i32 1, %122
  %124 = zext i32 %123 to i64
  %125 = lshr i64 %120, %124
  br label %126

126:                                              ; preds = %119, %114
  %127 = phi i32 [ %111, %114 ], [ %121, %119 ]
  %128 = phi i32 [ %110, %114 ], [ %122, %119 ]
  %129 = phi i64 [ %118, %114 ], [ %125, %119 ]
  %130 = bitcast i64 %129 to double
  %131 = fneg double %1
  %132 = icmp slt i64 %8, 0
  %133 = select i1 %132, double %131, double %1
  %134 = icmp eq i32 %128, %67
  br i1 %134, label %150, label %135

135:                                              ; preds = %126
  %136 = add nsw i32 %128, 1
  %137 = icmp eq i32 %136, %67
  br i1 %137, label %138, label %153

138:                                              ; preds = %135
  %139 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %140 = tail call double @llvm.experimental.constrained.fmul.f64(double %139, double %130, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %141 = tail call i1 @llvm.experimental.constrained.fcmps.f64(double %140, double %133, metadata !"ogt", metadata !"fpexcept.ignore") #2
  br i1 %141, label %150, label %142

142:                                              ; preds = %138
  %143 = tail call double @llvm.experimental.constrained.sitofp.f64.i32(i32 2, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %144 = tail call double @llvm.experimental.constrained.fmul.f64(double %143, double %130, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %145 = tail call i1 @llvm.experimental.constrained.fcmp.f64(double %144, double %133, metadata !"oeq", metadata !"fpexcept.ignore") #2
  %146 = xor i1 %145, true
  %147 = and i32 %127, 1
  %148 = icmp eq i32 %147, 0
  %149 = select i1 %146, i1 true, i1 %148
  br i1 %149, label %153, label %150

150:                                              ; preds = %142, %138, %126
  %151 = tail call double @llvm.experimental.constrained.fsub.f64(double %130, double %133, metadata !"round.dynamic", metadata !"fpexcept.ignore") #2
  %152 = add i32 %127, 1
  br label %153

153:                                              ; preds = %150, %142, %135
  %154 = phi double [ %151, %150 ], [ %130, %142 ], [ %130, %135 ]
  %155 = phi i32 [ %152, %150 ], [ %127, %142 ], [ %127, %135 ]
  %156 = and i32 %155, 2147483647
  %157 = xor i64 %8, %4
  %158 = sub nsw i32 0, %156
  %159 = icmp slt i64 %157, 0
  %160 = select i1 %159, i32 %158, i32 %156
  store i32 %160, i32* %2, align 4, !tbaa !3
  %161 = fneg double %154
  %162 = icmp slt i64 %4, 0
  %163 = select i1 %162, double %161, double %154
  br label %164

164:                                              ; preds = %71, %22, %153, %18
  %165 = phi double [ %21, %18 ], [ %163, %153 ], [ %0, %22 ], [ %0, %71 ]
  ret double %165
}

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fmul.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fdiv.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.sitofp.f64.i32(i32, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmps.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare i1 @llvm.experimental.constrained.fcmp.f64(double, double, metadata, metadata) #1

; Function Attrs: inaccessiblememonly mustprogress nofree nosync nounwind willreturn
declare double @llvm.experimental.constrained.fsub.f64(double, double, metadata, metadata) #1

attributes #0 = { nofree nosync nounwind optsize strictfp "frame-pointer"="none" "min-legal-vector-width"="0" "no-builtins" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "strictfp" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { inaccessiblememonly mustprogress nofree nosync nounwind willreturn }
attributes #2 = { strictfp }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{!"Ubuntu clang version 14.0.6"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
